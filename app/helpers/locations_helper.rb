module LocationsHelper

    #現在のキャンプ場ページを返す
    def current_page_id
        str = request.fullpath
        str.split("/").third
    end

end