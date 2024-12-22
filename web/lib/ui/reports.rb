# web/lib/ui/reports.rb
class Taginfo < Sinatra::Base

    get! '/reports' do
        @title = t.taginfo.reports
        section :reports
        erb :'reports/index'
    end

    Report.each do |report|
        get report.url do
            if report.redirect then
                redirect report.redirect
            else
                @title = [report.title, t.taginfo.reports]
                section :reports
                javascript_if_exists "pages/reports/#{ report.name }"
                erb ('reports/' + report.name).to_sym
            end
        end
    end

end
