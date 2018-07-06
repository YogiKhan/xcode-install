module XcodeInstall
  class Command
    class List < Command
      self.command = 'list'
      self.summary = 'List Xcodes available for download.'

      def self.options
        [['--all', 'Show all available versions. (Default, Deprecated)'],
        ['--last', 'shot the last which is latest versions.']].concat(super)
      end

      def initialize(argv)
        @all = argv.flag?('all',true)
        @last = argv.flag?('last',false)
        super
      end

      def run
        installer = XcodeInstall::Installer.new
        if @last
        puts installer.last
        else
        puts installer.list
        end
      end
    end
  end
end
