class SearchesController < ApplicationController

    require 'uri'
    require 'net/http'
    
    # 検索
    def new
        # redirect_to searches_path
    end

    # 検索結果ページ
    def index
        # s = params['keyword']
        # q = {
        #     :applicationId => ENV['RAKUTEN_API'],
        #     :keyword => s,
        #     :booksGenreld => '000'
        # }
        # client = HTTPClient.new
        
        # request = client.get('https://app.rakuten.co.jp/services/api/BooksTotal/Search/20170404', q)
        # @api_params = JSON.parse(request.body)
        

        s = params['keyword']
        query = {
            :q => s
        }
        client = HTTPClient.new
        request = client.get('https://www.googleapis.com/books/v1/volumes',query)
        @api_params = JSON.parse(request.body)


    end

end
