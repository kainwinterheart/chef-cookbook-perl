#
# Cookbook Name:: perl
# Attributes:: default
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform']
when "redhat","centos","scientific","amazon","oracle","fedora"
  default['perl']['packages'] = %w{ perl perl-libwww-perl perl-CPAN }
  case node['platform_version'].to_i
  when 5
    default['perl']['packages'] = %w{ perl perl-libwww-perl  }
  when 6
    default['perl']['packages'] = %w{ perl perl-libwww-perl perl-CPAN }
  end
when "debian","ubuntu","mint"
  default['perl']['packages'] = %w{ perl libperl-dev }
when "arch"
  default['perl']['packages'] = %w{ perl perl-libwww }
when "windows"
  default['perl']['maj_version'] = '5'
  default['perl']['min_version'] = '16'
  default['perl']['sub_version'] = '1.1'
  case node['kernel']['machine'].to_s
  when "x86_64"
	default['perl']['bitness'] = '64bit'
  else
    default['perl']['bitness'] = '32bit'
  end
else
  default['perl']['packages'] = %w{ perl libperl-dev }
end

default[:perl][:cpanm][:version] = '1.6921'
default['perl']['cpanm']['url'] = nil # 'https://raw.github.com/miyagawa/cpanminus/1.5015/cpanm'
default['perl']['cpanm']['checksum'] = '0f731e22e9b25dbfca063b12c0c2f4283c25138d595b1a6f40dd909d4fa6a627' # '8cb7b62b55a3043c4ccb'
default['perl']['cpanm']['path'] = '/usr/local/bin/cpanm'

default['perl']['install_dir'] = 'C:\\perl\\'

default[:perl][:modules] = []


