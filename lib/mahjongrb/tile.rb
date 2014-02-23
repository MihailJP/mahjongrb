# -*- coding: utf-8 -*-
require 'singleton'

module MahjongRB
	# Superclass for Mahjong tiles
	class Tile
		include Singleton
		include Comparable
		def to_s; '🀫'; end
		def to_i; nil; end
		def suited?; false; end
		def character?; false; end
		def bamboo?; false; end
		def circle?; false; end
		def honor?; false; end
		def wind?; false; end
		def dragon?; false; end
		def flower?; false; end
		def <=>(other)
			self.sortkey <=> other.sortkey
		end
		def inspect; self.to_s; end
		def sortkey; 99; end
	end

	# Superclass for suited tiles
	class SuitedTile < Tile
		def suited?; true; end
	end

	# Superclass for character suit (Wanzi, Wanzu)
	class CharacterTile < SuitedTile
		def character?; true; end
	end

	# Superclass for bamboo suit (Suozi, Sohzu)
	class BambooTile < SuitedTile
		def bamboo?; true; end
	end

	# Superclass for ciecle suit (Tongzi, Pinzu)
	class CircleTile < SuitedTile
		def circle?; true; end
	end

	# Superclass for honor tiles
	class HonorTile < Tile
		def honor?; true; end
	end

	# Superclass for wind tiles (Fengpai, Kazehai)
	class WindTile < HonorTile
		def wind?; true; end
	end

	# Superclass for dragon tiles (Sanyuanpai, Sangenpai)
	class DragonTile < HonorTile
		def dragon?; true; end
	end

	# Superclass for flower tiles
	class FlowerTile < Tile
		def flower?; true; end
	end

	# Wind tiles
	class EastWindTileClass < WindTile
		def to_s; '🀀'; end
		def sortkey; 31; end
	end
	class SouthWindTileClass < WindTile
		def to_s; '🀁'; end
		def sortkey; 32; end
	end
	class WestWindTileClass < WindTile
		def to_s; '🀂'; end
		def sortkey; 33; end
	end
	class NorthWindTileClass < WindTile
		def to_s; '🀃'; end
		def sortkey; 34; end
	end

	# Dragon tiles
	class RedDragonTileClass < DragonTile
		def to_s; '🀄'; end
		def sortkey; 37; end
	end
	class GreenDragonTileClass < DragonTile
		def to_s; '🀅'; end
		def sortkey; 36; end
	end
	class WhiteDragonTileClass < DragonTile
		def to_s; '🀆'; end
		def sortkey; 35; end
	end

	# Character suit tiles
	class Character1Class < CharacterTile
		def to_s; '🀇'; end
		def to_i; 1; end
		def sortkey; 1; end
	end
	class Character2Class < CharacterTile
		def to_s; '🀈'; end
		def to_i; 2; end
		def sortkey; 2; end
	end
	class Character3Class < CharacterTile
		def to_s; '🀉'; end
		def to_i; 3; end
		def sortkey; 3; end
	end
	class Character4Class < CharacterTile
		def to_s; '🀊'; end
		def to_i; 4; end
		def sortkey; 4; end
	end
	class Character5Class < CharacterTile
		def to_s; '🀋'; end
		def to_i; 5; end
		def sortkey; 5; end
	end
	class Character6Class < CharacterTile
		def to_s; '🀌'; end
		def to_i; 6; end
		def sortkey; 6; end
	end
	class Character7Class < CharacterTile
		def to_s; '🀍'; end
		def to_i; 7; end
		def sortkey; 7; end
	end
	class Character8Class < CharacterTile
		def to_s; '🀎'; end
		def to_i; 8; end
		def sortkey; 8; end
	end
	class Character9Class < CharacterTile
		def to_s; '🀏'; end
		def to_i; 9; end
		def sortkey; 9; end
	end

	# Bamboo suit tiles
	class Bamboo1Class < BambooTile
		def to_s; '🀐'; end
		def to_i; 1; end
		def sortkey; 11; end
	end
	class Bamboo2Class < BambooTile
		def to_s; '🀑'; end
		def to_i; 2; end
		def sortkey; 12; end
	end
	class Bamboo3Class < BambooTile
		def to_s; '🀒'; end
		def to_i; 3; end
		def sortkey; 13; end
	end
	class Bamboo4Class < BambooTile
		def to_s; '🀓'; end
		def to_i; 4; end
		def sortkey; 14; end
	end
	class Bamboo5Class < BambooTile
		def to_s; '🀔'; end
		def to_i; 5; end
		def sortkey; 15; end
	end
	class Bamboo6Class < BambooTile
		def to_s; '🀕'; end
		def to_i; 6; end
		def sortkey; 16; end
	end
	class Bamboo7Class < BambooTile
		def to_s; '🀖'; end
		def to_i; 7; end
		def sortkey; 17; end
	end
	class Bamboo8Class < BambooTile
		def to_s; '🀗'; end
		def to_i; 8; end
		def sortkey; 18; end
	end
	class Bamboo9Class < BambooTile
		def to_s; '🀘'; end
		def to_i; 9; end
		def sortkey; 19; end
	end

	# Circle suit tiles
	class Circle1Class < CircleTile
		def to_s; '🀙'; end
		def to_i; 1; end
		def sortkey; 21; end
	end
	class Circle2Class < CircleTile
		def to_s; '🀚'; end
		def to_i; 2; end
		def sortkey; 22; end
	end
	class Circle3Class < CircleTile
		def to_s; '🀛'; end
		def to_i; 3; end
		def sortkey; 23; end
	end
	class Circle4Class < CircleTile
		def to_s; '🀜'; end
		def to_i; 4; end
		def sortkey; 24; end
	end
	class Circle5Class < CircleTile
		def to_s; '🀝'; end
		def to_i; 5; end
		def sortkey; 25; end
	end
	class Circle6Class < CircleTile
		def to_s; '🀞'; end
		def to_i; 6; end
		def sortkey; 26; end
	end
	class Circle7Class < CircleTile
		def to_s; '🀟'; end
		def to_i; 7; end
		def sortkey; 27; end
	end
	class Circle8Class < CircleTile
		def to_s; '🀠'; end
		def to_i; 8; end
		def sortkey; 28; end
	end
	class Circle9Class < CircleTile
		def to_s; '🀡'; end
		def to_i; 9; end
		def sortkey; 29; end
	end

	# Circle suit tiles
	class PlumFlowerClass < FlowerTile
		def to_s; '🀢'; end
		def sortkey; 45; end
	end
	class OrchidFlowerClass < FlowerTile
		def to_s; '🀣'; end
		def sortkey; 46; end
	end
	class ChrysanthemumFlowerClass < FlowerTile
		def to_s; '🀤'; end
		def sortkey; 48; end
	end
	class BambooFlowerClass < FlowerTile
		def to_s; '🀥'; end
		def sortkey; 47; end
	end
	class SpringSeasonClass < FlowerTile
		def to_s; '🀦'; end
		def sortkey; 41; end
	end
	class SummerSeasonClass < FlowerTile
		def to_s; '🀧'; end
		def sortkey; 42; end
	end
	class AutumnSeasonClass < FlowerTile
		def to_s; '🀨'; end
		def sortkey; 43; end
	end
	class WinterSeasonClass < FlowerTile
		def to_s; '🀩'; end
		def sortkey; 44; end
	end

	# Singleton instances
	module Tiles
		def east  ; EastWindTileClass.instance; end
		def south ; SouthWindTileClass.instance; end
		def west  ; WestWindTileClass.instance; end
		def north ; NorthWindTileClass.instance; end
		def red   ; RedDragonTileClass.instance; end
		def green ; GreenDragonTileClass.instance; end
		def white ; WhiteDragonTileClass.instance; end

		def char1 ; Character1Class.instance; end
		def char2 ; Character2Class.instance; end
		def char3 ; Character3Class.instance; end
		def char4 ; Character4Class.instance; end
		def char5 ; Character5Class.instance; end
		def char6 ; Character6Class.instance; end
		def char7 ; Character7Class.instance; end
		def char8 ; Character8Class.instance; end
		def char9 ; Character9Class.instance; end

		def bamb1 ; Bamboo1Class.instance; end
		def bamb2 ; Bamboo2Class.instance; end
		def bamb3 ; Bamboo3Class.instance; end
		def bamb4 ; Bamboo4Class.instance; end
		def bamb5 ; Bamboo5Class.instance; end
		def bamb6 ; Bamboo6Class.instance; end
		def bamb7 ; Bamboo7Class.instance; end
		def bamb8 ; Bamboo8Class.instance; end
		def bamb9 ; Bamboo9Class.instance; end

		def circ1 ; Circle1Class.instance; end
		def circ2 ; Circle2Class.instance; end
		def circ3 ; Circle3Class.instance; end
		def circ4 ; Circle4Class.instance; end
		def circ5 ; Circle5Class.instance; end
		def circ6 ; Circle6Class.instance; end
		def circ7 ; Circle7Class.instance; end
		def circ8 ; Circle8Class.instance; end
		def circ9 ; Circle9Class.instance; end

		def plum   ; PlumFlowerClass.instance; end
		def orchid ; OrchidFlowerClass.instance; end
		def chrys  ; ChrysanthemumFlowerClass.instance; end
		def bamboo ; BambooFlowerClass.instance; end
		def spring ; SpringSeasonClass.instance; end
		def summer ; SummerSeasonClass.instance; end
		def autumn ; AutumnSeasonClass.instance; end
		def winter ; WinterSeasonClass.instance; end

		module_function :east, :south, :west, :north, :red, :green, :white
		module_function :char1, :char2, :char3, :char4, :char5, :char6, :char7, :char8, :char9
		module_function :bamb1, :bamb2, :bamb3, :bamb4, :bamb5, :bamb6, :bamb7, :bamb8, :bamb9
		module_function :circ1, :circ2, :circ3, :circ4, :circ5, :circ6, :circ7, :circ8, :circ9
		module_function :plum, :orchid, :chrys, :bamboo, :spring, :summer, :autumn, :winter

		def characters
			[char1, char2, char3, char4, char5, char6, char7, char8, char9]
		end
		def bamboos
			[bamb1, bamb2, bamb3, bamb4, bamb5, bamb6, bamb7, bamb8, bamb9]
		end
		def circles
			[circ1, circ2, circ3, circ4, circ5, circ6, circ7, circ8, circ9]
		end
		module_function :characters, :bamboos, :circles
	end
end
