# Ladder

## Set Up Environment

### Rails

Make sure you have ruby version 2.4.0.

Then install ruby version 2.4.0 with the following commmand `rvm install ruby-2.4.0`

If you do not have rvm, install RVM `\curl -sSL https://get.rvm.io | bash -s stable --ruby` then run the previous commmand again.

After cloning the repo, cd into the ladder folder and run `gem install bundle` if you haven't already.

Run `bundle install` to install the required gems.


**Run Rails Locally**: 
``` 
rails s
```

**Documentation**: http://guides.rubyonrails.org/

**View The App Locally**: Go to http://localhost:3000

### Postgres

**Install Postgres**: 
``` 
brew install postgres
```

**Create local database**:
```
createdb ladder-test
createdb ladder-development
```

**Destroy a database**:
```
dropdb ladder-test
dropdb ladder-development
```

**Migrate database**
```
rake db:migrate RAILS_ENV=test
rake db:migrate
```
