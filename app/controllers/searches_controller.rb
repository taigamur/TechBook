class SearchesController < ApplicationController

    require 'uri'
    require 'net/http'
    
    # 検索
    def new
    end

    # 検索結果ページ
    def index
        s = params['keyword']
        query = {
            :q => s
        }
        client = HTTPClient.new
        request = client.get('https://www.googleapis.com/books/v1/volumes',query)
        @api_params = JSON.parse(request.body)
    end

    def show
        
    end

end
