class SearchesController < ApplicationController

    require 'uri'
    require 'net/http'
    
    
    # 検索
    def new
        redirect_to searches_path
    end

    # 検索結果ページ
    def index
        s = 'DaiGo'
        q = {
            :applicationId => ENV['RAKUTEN_API'],
            :keyword => s,
            :booksGenreld => '000'
        }
        client = HTTPClient.new
        
        request = client.get('https://app.rakuten.co.jp/services/api/BooksTotal/Search/20170404', q)
        @api_params = JSON.parse(request.body)
      
    end

    # test: https://app.rakuten.co.jp/services/api/BooksTotal/Search/20170404?format=json&keyword=%E6%9C%AC&booksGenreId=000&applicationId=1080997820288206789

end
