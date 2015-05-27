# An Illustrated Introduction to the t-SNE Algorithm
This is an interactive introduction to a popular dimensionality reduction algorithm: t-distributed stochastic neighbor embedding (t-SNE). Developed by Laurens van der Maaten and Geoffrey Hinton (see the original paper here), this algorithm has been successfully applied to many real-world datasets. Here, we'll follow the original paper and describe the key mathematical concepts of the method, when applied to a toy dataset (handwritten digits). We'll use Python and the scikit-learn library.

## Quickstart 

You can run this in a docker container with all the dependencies pre-installed, interactively in your browser.

After `boot2docker start`:

```
docker pull zischwartz/thebe-local-docker:ffmpeg
docker run -d -p 8888:8888 -p 80:80 zischwartz/thebe-local-docker:ffmpeg
open http://$(boot2docker ip)
```

If the last step doesn't work, run `boot2docker ip` and visit that address in a browser. Generally, it's [http://192.168.59.103](http://192.168.59.103).

Note, this won't work if you're running another container that binds to these ports (80 and 8888).


## More Info 

Originally based on [this](https://github.com/ipython/docker-notebook/tree/master/scipyserver), which became [this](https://github.com/oreillymedia/thebe-docker-local).


### Build the Image 

For this, you need to clone down this repo, and then from this directory.

```
docker build -t zischwartz/thebe-local-docker  .
```

### To Run 

```
docker run -d -p 8888:8888 -p 80:80 -v $PWD/public:/var/www/html zischwartz/thebe-local-docker
```

Assuming you're running boot2docker, now you can visit http://192.168.59.103 in your browser.


### Run Container Interactively & SSH In For Debugging

```
docker run  -p 8888:8888 -p 80:80 -i -t --entrypoint /bin/bash zischwartz/thebe-local-docker
```

*Note:* I've been having trouble with the `-v` docker flag for volumes. Powering off  and on boot2docker seems to work it, but is a terrible solution.


### Build htmlbook

```
node ~/code/gulp-htmlbook/bin/gulp-htmlbook.js --envPath ~/code/gulp-htmlbook/.env --configPath $PWD/example_content/atlas.json --destination $PWD/public --copyAll
```

Next add the thebe assets

```
cp -R thebe_assets/ public/thebe_assets 
chmod -R a+r public
```

