function backup --argument filename
    # Description: Backup a named file by making a copy named $filename.bak
    cp $filename $filename.bak
end
