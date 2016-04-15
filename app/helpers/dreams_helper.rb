module DreamsHelper

  def parse_time_format(dream, klass)
    if klass.equal? Time
      klass.parse(dream.created_at.to_s).strftime('%Y年 %m月 %d日 %H:%M')
    elsif klass.equal? Date
      klass.parse(dream.created_at.to_s).strftime('%Y年%m月%d日')
    else
      raise ArgumentError.new('wrong arguments')
    end
  end
end
