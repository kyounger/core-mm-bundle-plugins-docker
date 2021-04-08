# build docker image with non-CAP plugins in the image

* Note, no `plugin-catalog.yaml` included in the CasC bundle.
* Only put CAP plugins in `plugins.yaml`
* `plugins.txt` is where you list your non-CAP plugins.

### Build
``` sh
docker build . --build-arg VERSION="$VERSION" -t $IMAGE
docker push $IMAGE
```

### Add image for use in CJOC
``` sh
java -jar /path/to/jenkins-cli/jenkins-cli.jar \
     -auth admin:admintoken \
     -s http://example.com/cjoc/ \
     groovy = < add-custom-image.groovy image-name image-tag

```

### Required system property for the Managed Controller
* `core.casc.config.bundle=/var/custom-casc-bundle/custom-bundle1`
