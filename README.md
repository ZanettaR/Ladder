# Ladder

## Set Up Environment

### Rails
1. After cloning the repo, cd into the ladder folder and run `gem install` if you haven't already.
2. Run `bundle install` to install the required gems.


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
