
node[:perl][:modules].each do |spec|
	unless spec[:deps].nil?
		unless spec[:deps][:packages].nil?
			spec[:deps][:packages].each do |pkg|
				package pkg[:name] do
					action :install
				end
			end
		end
	end

	cpan_module spec[:name] do
		version ( spec[:version] || '' )
	end
end

