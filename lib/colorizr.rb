class String

	@@colors = {black: 232, red: 1, green: 10, yellow: 11, blue: 21, pink: 207, light_grey: 247, white: 256, light_blue: 33}

	#Defines all of the color methods
	def create_colors
    	@@colors.each{|color_name, color_code| create_method(color_name, color_code)}
  	end

  	#Creates methods that return strings with color
	def create_method(color_name, color_code)
		  self.class.send(:define_method, "#{color_name}") do
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
			color_str = "#{color_name}"
			color_str.create_colors
			color_sym = color_str.to_sym
			puts "#{index}. " + color_str.send(color_sym)
			index += 1
		end
		puts ""
	end

end