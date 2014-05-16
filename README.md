Rails Oauth Authentication Server
=========
 Rails Based authentication server



How To Install
--------------

```sh
git clone https://github.com/shivil/rails_authentication_server.git rails_authentication_server
cd rails_authentication_server

Edit database.yml configuration

bundle exec rake db:setup
### Running Rails
bundle exec rails s
```

Application Flow
---

Sign up a new user and register a new client application. Then you will get the new app_secret, client_id

Login API requires client_id, app_secret, and redirect_uri as the parameters

**Login API**
```sh
http://0.0.0.0:3000/api/request/new?client_id=<client_id>&app_secret=app_secret&redirect_uri=<url>
```
then after successful user login,  redirects the user to the redirect_uri with the code


**Callback API**
```sh
http://0.0.0.0:3000/api/request/callback?code=<code>
```
The Authentication server will issue the access token as a JSON response to the client request 











    