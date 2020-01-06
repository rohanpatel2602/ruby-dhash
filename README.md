# DHasher

#### Installation
```sh
gem install dhasher
```

#### Usage
```sh
hash1 = DHasher.hash_from_path('/path/to/image.jpg')
hash2 =  DHasher.hash_from_blob(blob)
distance = DHasher.distance(hash1, hash2)
DHasher.similar?(hash1, hash2) # Considers a distance of 10 and under to be similar
```

#### Acknowledgements
Inspired by https://github.com/maccman/dhash and https://github.com/ameingast/cocoaimagehashing
