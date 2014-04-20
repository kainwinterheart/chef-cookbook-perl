
node[:perl][:modules].each do |spec|
	cpan_module spec[:name] do
		version ( spec[:version] || '' )
	end
end

