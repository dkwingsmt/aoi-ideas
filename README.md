# Things to notice before you clone
* Watch out for **junkish** code! (Otherwise **why** do I push it online for help?)

# Version I use
* Ruby: 1.8.7
* Rails: 3.2.11
* MySQL: 14.14

# Setup
1. Make sure you've installed rails and mysql, and clone
1. Run 
```bash
cp config/database.yml.bk config/database.yml
```
and change the three password fields in the latter file to whatever you like.
(You may keep the quotes. They will be ignored.)
1. Create mysql user `ideas` and grant sufficient privilages for `ideas\_%`
1. Run
```bash
bundle install
rake db:create
rake db:migrate
```

Then run
```bash
rails s
```
Should work now at [http://localhost:3000/](http://localhost:3000/).

# Database from the previous version
* You may find database structure is quite different from the previous version.
Even for `user` table. Importing is possible (and necessary for production).
~~Its just I'm too lazy.~~
  * But notice the current hash method for password is different from the previous
one (you may change it though).
* If you do not want to import right now ~~(like me)~~, you may create temporary
data using migration (like already done in two of the migrations).
  * You may create your own test account if you're feeling uncomfortable or
create mass random test entries. But remember to add it to git anyway, 
for schema.rb is changed.
