"""Create a proxied wp.<domain> A record pointing at this server. Idempotent."""
import os, json, sys, urllib.request, urllib.error

TOKEN = os.environ["CF_TOKEN"]
ORIGIN_IP = "195.15.201.70"
DOMAINS = sys.argv[1:]


def cf(path, method="GET", body=None):
    data = json.dumps(body).encode() if body else None
    req = urllib.request.Request(
        f"https://api.cloudflare.com/client/v4{path}", data=data, method=method,
        headers={"Authorization": f"Bearer {TOKEN}", "Content-Type": "application/json"},
    )
    try:
        with urllib.request.urlopen(req) as r:
            return json.loads(r.read())
    except urllib.error.HTTPError as e:
        return json.loads(e.read())


for d in DOMAINS:
    zr = cf(f"/zones?name={d}")
    if not zr.get("result"):
        print(f"{d}: NO ZONE — skipped")
        continue
    zid = zr["result"][0]["id"]
    host = f"wp.{d}"

    existing = cf(f"/zones/{zid}/dns_records?name={host}")
    if existing.get("result"):
        r = existing["result"][0]
        print(f"{host}: already exists -> {r['content']} "
              f"({'proxied' if r.get('proxied') else 'DNS-only'}) — left as-is")
        continue

    res = cf(f"/zones/{zid}/dns_records", "POST", {
        "type": "A", "name": host, "content": ORIGIN_IP,
        # Proxied: CF terminates TLS at the edge (its universal cert covers this
        # one-level subdomain) and absorbs the WordPress bot traffic that is
        # already probing these domains. Zone SSL mode is "full", so the origin
        # cert does not need to name wp.<domain>.
        "proxied": True,
        "comment": "legacy WordPress access after CF Workers migration",
    })
    if res.get("success"):
        print(f"{host}: CREATED -> {ORIGIN_IP} (proxied)")
    else:
        print(f"{host}: FAILED {res.get('errors')}")
