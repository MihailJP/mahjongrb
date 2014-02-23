# MahjongRB

Ruby library to do with Mahjong tiles

## Installation

Add this line to your application's Gemfile:

    gem 'mahjongrb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mahjongrb

## Usage

```ruby
require 'mahjongrb'
include MahjongRB # optional
include MahjongRB.Tiles #optional
```

If `include MahjongRB` is done, then you may invoke methods simply as `foo(bar)`.
Otherwise, you call methods by prefixed style like `MahjongRB.foo(bar)`.

### Tiles

Tiles as objects are retrieved from methods in `MahjongRB.Tiles`.

|Methods                               |Description                            |
|--------------------------------------|---------------------------------------|
|`east`, `south`, `west`, `north`      |Wind tiles _(Fengpai, Kazehai)_        |
|`red`, `green`, `white`               |Dragon tiles _(Sanyuanpai, Sangenpai)_ |
|`char1` to `char9`                    |Character suit _(Wanzi, Wanzu)_        |
|`bamb1` to `bamb9`                    |Bamboo suit _(Suozi, Sohzu)_           |
|`circ1` to `circ9`                    |Circle suit _(Tongzi, Pinzu)_          |
|`plum`, `orchid`, `chrys`, `bamboo`   |Flower tiles _(Huapai, Hanapai)_       |
|`spring`, `summer`, `autumn`, `winter`|Flower tiles _(Huapai, Hanapai)_       |
|`flower`                              |Abstract flower tile (for special use) |

#### Sequence of suited tiles

These methods return an array consisting of nine uniformly suited tile objects in ascending order.

|Method      |Returns an array of...          |
|------------|--------------------------------|
|`characters`|Character suit _(Wanzi, Wanzu)_ |
|`bamboos`   |Bamboo suit _(Suozi, Sohzu)_    |
|`circles`   |Circle suit _(Tongzi, Pinzu)_   |

... and also available:

|Method      |Returns a tuple of...                  |
|------------|---------------------------------------|
|`winds`     |Wind tiles _(Fengpai, Kazehai)_        |
|`dragons`   |Dragon tiles _(Sanyuanpai, Sangenpai)_ |
|`honors`    |Honor tiles _(Zipai, Jihai)_           |
|`flowers`   |Flower tiles _(Huapai, Hanapai)_       |

#### Sorting

Since `Tile` class includes `Comparable` module, an array of tile objects can be sorted by the following order.

1. Characters, ascending order
2. Bamboos, ascending order
3. Circles, ascending order
4. East, south, west, north
5. **White, green, red** dragons (in Japanese order)
6. Spring, summer, autumn, winter
7. Plum, orchid, chrysanthemum, bamboo (in Taiwanese order)
8. Invalid tile

### Tile object class hierarchy

* Tile
    * SuitedTile
        * CharacterTile
            * Character1Class
            * Character2Class
            * Character3Class
            * Character4Class
            * Character5Class
            * Character6Class
            * Character7Class
            * Character8Class
            * Character9Class
        * BambooTile
            * Bamboo1Class
            * Bamboo2Class
            * Bamboo3Class
            * Bamboo4Class
            * Bamboo5Class
            * Bamboo6Class
            * Bamboo7Class
            * Bamboo8Class
            * Bamboo9Class
        * CircleTile
            * Circle1Class
            * Circle2Class
            * Circle3Class
            * Circle4Class
            * Circle5Class
            * Circle6Class
            * Circle7Class
            * Circle8Class
            * Circle9Class
    * HonorTile
        * WindTile
            * EastWindTileClass
            * SouthWindTileClass
            * WestWindTileClass
            * NorthWindTileClass
        * DragonTile
            * RedDragonTileClass
            * GreenDragonTileClass
            * WhiteDragonTileClass
    * FlowerTile
        * PlumFlowerClass
        * OrchidFlowerClass
        * ChrysanthemumFlowerClass
        * BambooFlowerClass
        * SpringSeasonClass
        * SummerSeasonClass
        * AutumnSeasonClass
        * WinterSeasonClass

#### Methods implemented in tile object class

|Methods     |Description                                                 |
|------------|------------------------------------------------------------|
|`to_s`      |shows with Unicode Mahjong tile character                   |
|`to_i`      |an integer value if `self` is a suited tile, `nil` otherwise|
|`suited?`   |`true` if `self` is a suited tile                           |
|`character?`|`true` if `self` is a tile of character suit                |
|`bamboo?`   |`true` if `self` is a tile of bamboo suit                   |
|`circle?`   |`true` if `self` is a tile of circle suit                   |
|`honor?`    |`true` if `self` is a honor tile, i.e. wind or dragon tile  |
|`wind?`     |`true` if `self` is a wind tile                             |
|`dragon?`   |`true` if `self` is a dragon tile                           |
|`flower?`   |`true` if `self` is a flower tile                           |
|`<=>`       |spaceship operator which compares sort keys of two tiles    |
|`inspect`   |returns `self.to_s`                                         |
|`sortkey`   |returns the integer sort key of `self`                      |
|`terminal?` |`true` if `self` is a terminal tile, i.e. one or nine       |
|`termHonor?`|returns `self.terminal? or self.honor?`                     |

#### Mix-ins

* `Singleton`
* `Comparable`

### Make an array of tile objects from a string

```ruby
MahjongRB.str2tile("123m456p789sPPPNN")
```

#### Alphabetic notation

This notation is widely used by Japanese (especially online) Mahjong players.

|Regexp   |Description   |
|---------|--------------|
|`[1-9]+m`|Character suit|
|`[1-9]+s`|Bamboo suit   |
|`[1-9]+p`|Circle suit   |
|`[ESWN]` |Wind tiles    |
|`P`      |White dragon  |
|`F`      |Green dragon  |
|`C`      |Red dragon    |
|`\s`     |ignored       |

#### Unicode notation

Not implemented at this moment.

#### Exception

This method raises `ArgumentError` if the argument is invalid.

### Count tiles in a sequence by kind

```ruby
MahjongRB.countTiles(MahjongRB.str2tile("1112345678999m"))
```

This method returns a hash with tile objects as keys.
All flower tiles are put in `MahjongRB.tiles.flower` key together.

#### Exception

This method raises `ArgumentError` if the sequence includes an invalid tile object.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
