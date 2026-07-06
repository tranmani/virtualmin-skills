---
name: virtualmin-mail
description: Manage mail settings, spam filtering, and test mail connectivity for Virtualmin domains
license: MIT
metadata:
  author: tranmani
  email: minhhuy8137@gmail.com
  version: 1.0.0
  docs: https://www.virtualmin.com/docs/development/api-programs/modify-mail/
---

# Virtualmin Mail

Configure mail delivery, spam/virus filtering, and test mail server connectivity.

## When to Use

- Change spam or virus filtering settings for a domain
- Search mail logs for delivery issues
- Test SMTP, IMAP, or POP3 connectivity
- Set global spam handling

## Available Scripts

| Script | Command | Description |
|--------|---------|-------------|
| `modify-mail.sh` | `virtualmin modify-mail` | Change mail settings for a domain |
| `set-spam.sh` | `virtualmin set-spam` | Configure spam filtering globally |
| `search-maillogs.sh` | `virtualmin search-maillogs` | Search mail delivery logs |
| `test-smtp.sh` | `virtualmin test-smtp` | Test SMTP server connectivity |
| `test-imap.sh` | `virtualmin test-imap` | Test IMAP server connectivity |
| `test-pop3.sh` | `virtualmin test-pop3` | Test POP3 server connectivity |

## Usage

```bash
sudo bash modify-mail.sh --domain example.com --spam yes --virus yes
sudo bash search-maillogs.sh --domain example.com --to user@example.com
sudo bash test-smtp.sh --domain example.com
sudo bash test-imap.sh --domain example.com
```

## Notes

- `test-smtp/imap/pop3.sh` are the first tools to run when diagnosing mail delivery failures
- Spam filtering requires SpamAssassin; virus scanning requires ClamAV
- `search-maillogs.sh` searches Postfix logs — faster than grepping raw log files
- Raw mail logs are at `/var/log/mail.log` (Ubuntu) or `/var/log/maillog` (CentOS)
