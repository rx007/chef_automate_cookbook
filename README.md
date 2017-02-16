# Chef Automate Cookbook

This cookbook installs and configures Chef Automate.


## Requirements

#### Platform
- `All platforms`

#### Dependencies
- `build-essentials`


## Attributes
List of chef_automate attributes:

#### chef_automate::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef_automate']['bacon']</tt></td>
    <td>int</td>
    <td>bacon</td>
    <td><tt>bacon</tt></td>
  </tr>
</table>


## Usage

#### Install using Berkshelf
You can install this cookbook using Berkshelf.



#### Install using Chef Supermarket



#### chef_automate::default
Just include `chef_automate` in your node's `run_list`:



#### include_recipe
Just include `chef_automate` in your recipes/default.rb or recipe file



## Author(s)

- `rx007` <rx007@me.com>



## License

This is licensed under Apache 2.0
