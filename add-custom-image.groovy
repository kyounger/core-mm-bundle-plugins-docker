import com.cloudbees.jce.masterprovisioning.DockerImageDefinition
import com.cloudbees.jce.masterprovisioning.DockerImageDefinitionConfiguration

if (args.length != 2) {
    println "args required: image-name, image"
    return
}

def imageName = args[0]
def image = args[1]

// println(DockerImageDefinitionConfiguration.getInstance().getImages())

DockerImageDefinition myImage = new DockerImageDefinition(imageName, image)
DockerImageDefinitionConfiguration.getInstance().setImage(myImage)

// println(DockerImageDefinitionConfiguration.getInstance().getImages())
