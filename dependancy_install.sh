# # # Dependancies  # # #

# Adding Node.js repository
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

# Adding Yarn repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Install redis server
sudo add-apt-repository ppa:chris-lea/redis-server -y

# Refresh our packages list with the new repositories
sudo apt-get update -y

# Install our dependencies for compiiling Ruby along with Node.js and Yarn
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev dirmngr gnupg apt-transport-https ca-certificates redis-server redis-tools nodejs yarn -y

# # # End of Dependancies # # #



# # # Install Ruby Version Manager # # #

# Clone rbenv repo (to ~/.rbenv path)
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# Clone ruby-build plugin repo (to ~/.rbenv/plugins/ruby-build) Tools to Compile Ruby
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Clone rbenv-vars plugin repo (to ~/.rbenv/plugins/rbenv-vars) Create Environment variables app on server
git clone https://github.com/rbenv/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars

# Add the rbenv bin folder to path
echo 'PATH="$HOME/.rbenv/plugins/ruby-build/bin:$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# Reload bash shell
exec $SHELL

# Test command
rbenv

# Install ruby 3.2.2
rbenv install 3.2.2

# Set global ruby version to 3.2.2
rbenv global 3.2.2

# Install bundler ruby gem
gem install bundler

# Download key for Passenger
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7

# Save key
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenter bionic main > /etc/apt/sources.list.d/passenger.list'

# Update
sudo apt update

# Install NGINX
sudo apt install -y nginx-extras libnginx-mod-http-passenter
# ^ This will trigger nginx reload, this should allow the 'Welcome to NGINX' site



# # # Install Ruby Version Manager # # #