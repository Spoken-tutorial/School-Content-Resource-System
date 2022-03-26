# School-Resource-System(AKA School-Content-Resource-System)

**Objective: Create a free online resource bank for students.**

**About** 

*School Resource System under the Spoken Tutorial project is a website prototype which provides ICT (Information and Communication Technologies) tools for teaching/learning and resource materials for school teachers and students focusing on age group below 12. It contains content in the form of various resource types, such as videos, concept maps, images, PhETs (Physics Education Technologies in collaboration with University of Colarado, Boulder) and links to various web pages. It consist of three interfaces i.e. User, Contributor (or teacher) and Admin, for better management and use. Website contains filter search as well as keyword search, so that minimum time is required to access a resource. The resources are of four types, i.e. Concept maps (or Mind maps), PhETs, tutorials and links. These resources are all open source.*


**Interface categories**

```1. End User Interface: Can search for resources like tutorials, interactive modules, mind-maps and addtional links by selecting subjects and class. User can also browse content through the topic search option which auto populates the list of available topics based on keystrokes.```

```2. Contributor Interface: Can upload various resources to the system.```

```3. Admin Interface: Can review and publish the resources uploaded by the contributor.```


**Demo Videos**

**1. End User Interface**

https://user-images.githubusercontent.com/35317861/160241985-aab48274-7f54-4a10-9f22-292a875194e7.mp4

**2. Contributor Interface**: Contributes tutorial resource of physics for grade 6.

https://user-images.githubusercontent.com/35317861/160242097-13a17fe4-9fdf-4f26-861c-9fb9bb42432d.mp4

**3. Admin Interface**: Approving the resource contributed by the contributor int he above vdeo

https://user-images.githubusercontent.com/35317861/160242144-ca573bfd-f04e-47b8-826f-25448fff01e1.mp4

**4. Auto populating searcbox**

https://user-images.githubusercontent.com/35317861/160242158-a19e27a6-015a-485b-8502-9843415f95fe.mp4

**Silent features and learnings from project**

```a. Build Maven web project on Eclipse.```

```b. Add dependecies in pom.xml files of various .jar like mysql connector used```

```c. Add servlet mappings in web.xml to use services of backend(querying database and returning results) using inputs from frontend.```

```d. Work with servlets and Java Server Pages.```

```e. Work with MySQL and connect using jdbc.```

```f. Adding features like auto-list contents as user types in searchbox.```

```g. Added checks in form like requirement for good password and implementing MD5 to store password in DB in protected form.```


**Configuration**

```1. Download the entire project and open in Eclipse(for best experience).```

```2. At the time of building the project, I have used jave 1.8.0_271 (or any Java8 will do)```

```3. Used tomact v8.5.77```

```4. Dowload mysql connector jar, unzip it and in external jar, browse to location where you have kept the downloaded(and unzipped jar)```

```5. You can set the password for root as mysql or you can use any(just you need to change the places where I have incoked connection)```

```6. In SpokenTutorial.SQL find in this project you will find all the DDLs and intial insert vlaues to start with.```

```7. Start the project.```

```8. From the interface create 2 users.```

```9. Now go to the database(I have used MySQL workbench) and make one user as admin(by updating the user_roles table, change the role_id from 2 to 3 to make it admin).```
