# README

**The following users are avaiable for testing the app:**
* Alice:
	- Email: alice@email.com
	- Password: password
* Bob:
	- Email: bob@email.com
	- Password: password
* Any user can be used by retrieving their email from the Users page and logging in as that user. The password will be <code>password</code>

**Running the app:**
1. Clone repository to a local folder
2. Start postgresql (<code>sudo service posgresql start</code> to start and <code>sudo service postgresql status</code> to verify it is running)
3. Start redis-server (<code>sudo service redis-server start</code> to start and <code>sudo service redis-server status</code> to verify it is running). If you don't have redis-server installed, run <code>sudo apt install redis-server</code>
4. Start cron (<code>sudo service cron start</code> to start and <code>sudo service cron status</code> to verify it is running)
5. Run <code>bundle exec whenever --update-crontab</code>
6. Run <code>crontab -l</code> and check if groups:update is in the crontab. If it is, ensure it's <code>RAILS_ENV=development</code>. If the environment is production, run <code>whenever --update-crontab --set environment='development'</code>
7. Run <code>bundle install && yarn install</code>
8. Run <code>rails db:migrate:reset</code>
9. Then, run <code>rails db:seed</code>
10. Run <code>rails s</code> to launch app
11. Open a browser, and go to http://localhost:3000/
12. Log in to Alice's account using the top navbar.

	

The instructions above are designed to run within Ubuntu on Windows. If you don't have this installed, we can provide a demo on one of our machines.

Please let us know if you have any questions.
