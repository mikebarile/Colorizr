class String

	@@colors = {black: 232, red: 1, green: 10, yellow: 11, blue: 21, pink: 207,
		light_grey: 247, white: 256, light_blue: 33}

	#Defines all of the color methods
	def self.create_colors
    	@@colors.each{|color_name, color_code| self.create_method(color_name, color_code)}
  	end

  	#Creates methods that return strings with color
	def self.create_method(color_name, color_code)
		  self.send(:define_method, "#{color_name}") do
		  	"\e[38;5;#{color_code}m" + self + "\e[0m"
		  end
  	end

	#Returns an array of all color options
	def self.colors
		colors_array = []
		@@colors.each{|color_name, color_code| colors_array << color_name}
	end

	#Prints sample output demonstrating different colors
	def self.sample_colors
		index = 1
		puts ""
		@@colors.each do |color_name, color_code|
			color_str = color_name.to_s
			puts "#{index}. " + color_str.send(color_name)
			index += 1
		end
		puts ""
	end

	#Executes create_colors
	String.create_colors

end
