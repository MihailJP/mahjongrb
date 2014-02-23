require "mahjongrb/version"
require "mahjongrb/tile"

module MahjongRB
	# String to array of tiles
	def str2tile(str)
		srcStr = str.gsub(/\s/, '') # Ignore whitespace characters
		if /^([1-9]+[mps]|[ESWNPFC])*$/.match(srcStr) then
			tiles = []
			tile_tmp = []
			srcStr.each_char do |chr|
				if chr >= '1' and chr <= '9' then
					tile_tmp += [chr.to_i]
				elsif (chr == 'm' or chr == 'p' or chr == 's') and not tile_tmp.empty? then
					for tilenum in tile_tmp do
						tiles += [(chr == 'm' ? Tiles.characters : chr == 's' ? Tiles.bamboos : Tiles.circles)[tilenum - 1]]
					end
					tile_tmp = []
				elsif chr == 'E' and tile_tmp.empty? then tiles += [Tiles.east]
				elsif chr == 'S' and tile_tmp.empty? then tiles += [Tiles.south]
				elsif chr == 'W' and tile_tmp.empty? then tiles += [Tiles.west]
				elsif chr == 'N' and tile_tmp.empty? then tiles += [Tiles.north]
				elsif chr == 'P' and tile_tmp.empty? then tiles += [Tiles.white]
				elsif chr == 'F' and tile_tmp.empty? then tiles += [Tiles.green]
				elsif chr == 'C' and tile_tmp.empty? then tiles += [Tiles.red]
				else
					raise ArgumentError, "illegal character '#{chr}' detected in argument \"#{str}\""
				end
			end
			if not tile_tmp.empty? then
				raise ArgumentError, "suit character required after numerals; in argument \"#{str}\""
			end
			return tiles
		else
			raise ArgumentError, "cannot understand argument \"#{str}\""
		end
	end
	module_function :str2tile

	# Count tiles by kind
	def countTiles(tileList)
		result = {}
		for tile in (Tiles.characters + Tiles.bamboos + Tiles.circles + Tiles.honors + [Tiles.flower])
			result[tile] = 0
		end
		for tile in tileList
			if Tiles.flowers.include?(tile) then
				result[Tiles.flower] += 1
			elsif result.include?(tile) and tile != Tiles.flower then
				result[tile] += 1
			else
				raise ArgumentError, "invalid item found: #{tile}"
			end
		end
		return result
	end
	module_function :countTiles

end