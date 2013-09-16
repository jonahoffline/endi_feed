EndiFeed [![Build Status](https://travis-ci.org/jonahoffline/endi_feed.png?branch=master)](https://travis-ci.org/jonahoffline/endi_feed) [![Gem Version](https://badge.fury.io/rb/endi_feed.png)](http://badge.fury.io/rb/endi_feed) [![Dependency Status](https://gemnasium.com/jonahoffline/endi_feed.png)](https://gemnasium.com/jonahoffline/endi_feed) [![Code Climate](https://codeclimate.com/github/jonahoffline/endi_feed.png)](https://codeclimate.com/github/jonahoffline/endi_feed)
=================

Endi is a Ruby Gem and command-line application for getting the latest news from endi.com / El Nuevo Dia Newspaper

Installation
---------------------

    $ gem install endi_feed

## Usage ##

Ruby:

```ruby
require 'endi_feed'

EndiFeed.get_news 2
=> ["El Nuevo Dia : Noticias (http://www.elnuevodia.com/)", "Última actualización: 10:34:00 PM",
    "1. Trío asalta concesionario de autos en Moca (07/03/13) - http://goo.gl/OSq8K",
    "2. Listo Barranquitas para celebración del 4 de julio (07/03/13) - http://goo.gl/VJbmh"]

```

In your terminal:

```console
$ endifeed --news 5
El Nuevo Dia : Noticias (http://www.elnuevodia.com/)
Última actualización: 10:34:00 PM
1. Trío asalta concesionario de autos en Moca (07/03/13) - http://goo.gl/OSq8K
2. Listo Barranquitas para celebración del 4 de julio (07/03/13) - http://goo.gl/VJbmh
3. Alguaciles federales detienen uno de los más buscados (07/03/13) - http://goo.gl/pq09S
4. Identifican a mujer que se lanzó del puente Julia de Burgos (07/03/13) - http://goo.gl/ljU0W
5. Hallan cadáver de hombre desaparecido en Carolina (07/03/13) - http://goo.gl/9CqcH
```

### Command-Line Options ###

  * -n, --news [total]  - total of news to fetch
  * -h, --help          - show help message

## Todo
 * Save results to file (html, text)
 * Select Url API to use in request
 
## Author
  * [Jonah Ruiz](http://www.pixelhipsters.com)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/jonahoffline/endi_feed/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

