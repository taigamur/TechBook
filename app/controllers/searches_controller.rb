class SearchesController < ApplicationController

    require 'uri'
    require 'net/http'
    
    
    # 検索
    def new
        redirect_to searches_path
    end

    # 検索結果ページ
    def index
        uri = URI('https://app.rakuten.co.jp/services/api/BooksTotal/Search/20170404')
        params = {
            :applicationId => ENV['RAKUTEN_API'] 
            # :keyword => "DaiGo"
        }
        uri.query = URI.encode_www_form(params)
        res = Net::HTTP.get_response(uri)
        @test = Net::HTTP.get_response(uri)
        @book = res.body
    end

end
