using Downloads
id = "000000000000"
len = length(id)
ids = lpad.(0:78, len, '0')
urls = "https://placedata.reddit.com/data/canvas-history/2022_place_canvas_history-" .* ids .* ".csv.gzip"
@sync for url in urls
    @show url
    fn = "data/$(basename(url))"
    @async Downloads.download(url, fn)
    # run(`gunzip $(fn)`)
end
