module ApplicationHelper

    def get_elapsed_time(created_at)
        sec = (Time.zone.now - created_at).round
        days = sec / (60 * 60 * 24)
        return "#{days}d" unless days.zero? #日数を返す
        hours = sec  / (60 * 60)
        return "#{hours}h" unless hours.zero?
        min = sec / 60
        return "#{min}m" unless min.zero?
        "#{sec}s"
    end

end
