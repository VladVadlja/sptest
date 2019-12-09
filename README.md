# SmartPension - Test
"Analyzer" is simple analyzer for weblog files. It will analyze input filename (holding path and ip address) and print results to stdout.

For printing it will use [terminal-table](https://github.com/tj/terminal-table) gem.


## Installation
Position yourself in working directory

`$ git clone https://github.com/VladVadlja/sptest.git`

`$ cd sptest`

`$ bundle install`

## Run
`$ ./ruby_app.rb webserver.log`

or

`$ ./ruby_app.rb _filename_`

File should be in format:

_path_ _ip-address_

i.e.:

`/home 123.22.123.2`

## Output
Data will be sorted by number of visits or unique hits in descending order:

```
Most visited pages:
+--------------+-----------+
| Path         | # of hits |
+--------------+-----------+
| /about/2     | 90        |
| /contact     | 89        |
| /index       | 82        |
| /about       | 81        |
| /help_page/1 | 80        |
| /home        | 78        |
+--------------+-----------+

Pages with most unique visits:
+--------------+---------------+
| Path         | # unique hits |
+--------------+---------------+
| /index       | 23            |
| /home        | 23            |
| /contact     | 23            |
| /help_page/1 | 23            |
| /about/2     | 22            |
| /about       | 21            |
+--------------+---------------+
```
