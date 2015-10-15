require 'facter/util/resolution'

output = Facter::Util::Resolution.exec('vsftpd -v 0>&1') || 'vsftpd: version 0'

Facter.add(:vsftpd_installed_version) do
  setcode do
    output.gsub(/^vsftpd: version ([\d\.]+)$/, '\1')
  end
end
