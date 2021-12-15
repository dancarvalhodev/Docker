# Docker Stack (With Postgresql)

#### A basic stack (with postgresql) built using Docker Engine.

**Only run `docker-compose up -d` and you're ready to work**

---

# Stack Version
- PHP 7.4.x (easily interchangeable in DockerFile, changing the first line).
- Postgresql 14.x
- Apache
- Built using Debian 11

---

# Tips
## Give apache write permition and local user same permition
`find /var/www -type d -exec chmod a+rwx,o-rwx,ug+s {} +` **(Inside Container)**
`sudo chown -R dan:www-data src/` **(Into docker folder all data into src folder)**

## Into scripts folder exists a blueprint of a restore shell script example.
This file need to rename add a .sh into name and add a user and database inside of file