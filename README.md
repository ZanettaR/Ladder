# Ladder

## Set Up Environment

### Rails
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
