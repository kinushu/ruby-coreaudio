require "coreaudio"

# 入力文字列を名称に含むオーディオデバイスをデフォルト出力として設定
def set_interface(name)
	if !name
		puts 'please enter audio output interface name.'
		return -1
	end

	devs = CoreAudio::devices

	tgt = devs.find{|dev| dev.name.index(name)}
	if !tgt
		p 'no match interface #{tgt.name}' 
		return -1
	end

	CoreAudio::set_default_output_device(tgt)
	p "select default output audio interface #{tgt.name}"
end

set_interface(ARGV[0])
