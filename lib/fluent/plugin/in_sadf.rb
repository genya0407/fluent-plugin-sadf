class SadfInput < Fluent::Input
    Fluent::Plugin.register_input('sadf', self)

    config_param :sar_option,       :string,  default: ''
    config_param :tag,              :string,  default: 'sadf_result.tag'
    config_param :interval,         :integer, default: 5
    config_param :hostname_output,  :bool,    default: true 
    config_param :hostname,         :string,  default: Socket.gethostname

    def configure(conf)
        super
        @interval_m = @sar_option.split.size.zero? ? @interval * 60 : @interval * 60 - 1
        begin
           `sar -V`
        rescue
           raise Fluent::ConfigError, "sar(sysstat) is not installed."
        end
    end

    def start
        super
        @thread = Thread.new(&method(:run))
    end

    def shutdown
        @thread.kill
    end

    private

    def run
        loop do
            @result             = Hash.new
            @result["hostname"] = @hostname if @hostname_output
            @result["args"]     = @sar_option
            Fluent::Engine.emit(@tag, Fluent::Engine.now, @result.merge(sadf_execute(@sar_option)))
            sleep @interval_m
        end
    end

    def sadf_execute(opt)
        rec = Hash.new

        `LANG=C sadf -- #{opt} 1 1`.split("\n").each {| line |
            array = line.split("\t")
            if !rec.has_key?(array[3]) then
              rec[array[3]] = Hash.new
            end
            rec[array[3]][array[4]] = array[5]
        }

        rec
    end
end
