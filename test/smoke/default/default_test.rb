# # encoding: utf-8

# Inspec test for recipe chef_automate_cookbook::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


describe port(80) do
  it { should_not be_listening }
  skip 'This is an example test, replace with your own test.'
end
