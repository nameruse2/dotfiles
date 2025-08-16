function pirate -d "Search the pirate bay and download a torrent"
    set mysearchterm (string replace -a " " + "$argv")
    set pirates (curl -s "https://prbay.top/index.php?q=$mysearchterm" | grep "<td><nobr>")
    set -g my_counter 1
    for each_result in $pirates:
        echo -n "$my_counter  "
        string match -r --groups-only "(?:=\S+?=)(?:\S+?=)(\S+?=)" $each_result
        set my_counter (math $my_counter +1)
    end
    set torrent_selection (read -P "select an option or q to quit ")
    echo $torrent_selection
    echo $pirates[$torrent_selection]
    echo "#open magnet link"
    open (string match -r --groups-only "(magnet?\S+)(?:\")" $pirates[$torrent_selection])
    # "\"?\S+[^\"]" is the regex to extract the magnet link
    # open is the mac command to open a file/link
end
