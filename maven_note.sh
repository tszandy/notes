##### This command generates the dependency tree of the maven project.
mvn dependency:tree

# This command cleans the maven project by deleting the target directory
mvn clean

# This command compiles the java source classes of the maven project.
mvn compiler:compile

# This command compiles the test classes of the maven project.
mvn compiler:testCompile

# This command builds the maven project and packages them into a JAR, WAR, etc.
mvn package

# This command builds the maven project and installs the project files (JAR, WAR, pom.xml, etc) to the local repository.
mvn install

# This command is used to deploy the artifact to the remote repository. 
mvn deploy

# This command validates the maven project that everything is correct and all the necessary information is available.
mvn validate

##### This command analyzes the maven project to identify the unused declared and used undeclared dependencies. 
mvn dependency:analyze

##### Maven archetypes is a maven project templating toolkit.
mvn archetype:generate

# This command generates a site for the project.
mvn site:site

# This command is used to run the test cases of the project using the maven-surefire-plugin.
mvn test

# It’s used to compile the source Java classes of the project.
mvn compile

# This command build the project, runs all the test cases and run any checks on the results of the integration tests to ensure quality criteria are met.
mvn verify

# This command prints the maven usage and all the available options for us to use.
mvn -help

# This command is used to build a project from a different location. 
mvn -f maven-example-jar/pom.xml package

# This command is used to run the maven build in the offline mode. 
mvn -o package

# Runs the maven build in the quiet mode, only the test cases results and errors are displayed.
mvn -q package

# Prints the maven version and runs the build in the debug mode. It’s opposite of the quiet mode and you will see a lot of debug messages in the console.
mvn -X package

# Used to display the maven version information.
mvn -v

# This command prints the maven version and then continue with the build. It’s equivalent to the commands mvn -v;mvn package.
mvn -V package

# The skipTests system property is used to skip the unit test cases from the build cycle. We can also use -Dmaven.test.skip=true to skip the test cases execution.
mvn -DskipTests package

# This command tells maven to run parallel builds using the specified thread count. 
mvn -T 4 package

# maven lifecycle
Clean Lifecycle
Phase                    Description
pre-clean                execute processes needed prior to the actual project cleaning
clean                    remove all files generated by the previous build
post-clean                execute processes needed to finalize the project cleaning

Default Lifecycle
Phase                    Description
validate                validate the project is correct and all necessary information is available.
initialize                initialize build state, e.g. set properties or create directories.
generate-sources        generate any source code for inclusion in compilation.
process-sources            process the source code, for example to filter any values.
generate-resources        generate resources for inclusion in the package.
process-resources        copy and process the resources into the destination directory, ready for packaging.
compile                    compile the source code of the project.
process-classes            post-process the generated files from compilation, for example to do bytecode enhancement on Java classes.
generate-test-sources    generate any test source code for inclusion in compilation.
process-test-sources    process the test source code, for example to filter any values.
generate-test-resources    create resources for testing.
process-test-resources    copy and process the resources into the test destination directory.
test-compile            compile the test source code into the test destination directory
process-test-classes    post-process the generated files from test compilation, for example to do bytecode enhancement on Java classes.
test                    run tests using a suitable unit testing framework. These tests should not require the code be packaged or deployed.
prepare-package            perform any operations necessary to prepare a package before the actual packaging. This often results in an unpacked, processed version of the package.
package                    take the compiled code and package it in its distributable format, such as a JAR.
pre-integration-test    perform actions required before integration tests are executed. This may involve things such as setting up the required environment.
integration-test        process and deploy the package if necessary into an environment where integration tests can be run.
post-integration-test    perform actions required after integration tests have been executed. This may including cleaning up the environment.
verify                    run any checks to verify the package is valid and meets quality criteria.
install                    install the package into the local repository, for use as a dependency in other projects locally.
deploy                    done in an integration or release environment, copies the final package to the remote repository for sharing with other developers and projects.


Phases are executed in a specific order. This means that if we run a specific phase using the command:
mvn <PHASE>
It won't only execute the specified phase, but all the preceding phases as well.

Maven SCM

Maven Wagon

Maven Doxia


# include dependency during packging
<build>
    <plugins>
      <!-- any other plugins -->
      <plugin>
        <artifactId>maven-assembly-plugin</artifactId>
        <executions>
          <execution>
            <phase>package</phase>
            <goals>
              <goal>single</goal>
            </goals>
          </execution>
        </executions>
        <configuration>
          <descriptorRefs>
            <descriptorRef>jar-with-dependencies</descriptorRef>
          </descriptorRefs>
        </configuration>
      </plugin>
    </plugins>
  </build>