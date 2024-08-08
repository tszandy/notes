git config --global user.email "xwddn1994@gmail.com"
git config --global user.name "Wei Xie"

npm install --global @angular/cli

ng new newproject --routing
ng add @angular/material

MVC architectural - model-view-controller
Model is the data presented to the user.
View is the user interface.
Controller combines both. it applies the model/data on a template/view.

MVVM architectural - model-view-viewmodel

Angular is framework for building front-end applications. It is an open source project driven by google.

The 1.x version are referred to as AngularJS
Everything beyond version 2.0 is just Angular.
8.2.7
major_version.minor_version.patch_level
8 is major_version
2 is minor_version
7 is patch_level

TypeScript is a superset of ECMAScript. It is an open source project backed by Microsoft.

Material Design is Google's design language

Design Language is developed to bring consistency in the look and feel.

package.json 
package.json is a promary configuration file for the new application package. It maintains the name of the application, the version number, and other types of metadata. npm(Node Package Manager)

angular.json
angular.json is a workspace configuration file. Angular CLI creates this file when the first Angular project is generated. 

serve, a configuration for running the application for development purposes.
build, a configuration for compiling and bundling the angular application.
production optimization options
Unit test and end-to-end test configurations.

tsconfig.json
tsconfig.json is a TypeScript configuration file. It has TypeScript compiler options, module system-related configurations, a directory location for type definitions, and so on.

tslint.json
tslint.json is a lint configuration for TypeScript code. The linting process ensures code quality, adherence to coding standards, and static code analysis.
TSLint checks TypeScript and Angular application code against configured rules and warns about any discrepancies.
This is the root configuration. For each project in the workspace, there is a specific lintconfiguration that extends the configuration from this file at the root directory.

Default Application Directory Root: /src
The first generated Angular application is placed in the /src directory at the root of the project. 
When you use CLI in a new directory, the first project is generated under the /src folder.
As we generate more projects with CLI, they are moved under a /projects folder. You can manually change it.

tsconfig.app.json and tsconfig.spec.json extend from /tsconfig.json which is the workspace-level TypeScript configuration file. 
The tsconfig.app.json file provides the TypeScript configuration for the application files.
The tsconfig.spec.json provides the TypeScript configuration for the unit test files. which are post-fixed with .spec.ts.

The tslint.json file in /src extends from tslint.json at the root directory. It provides a specific linting configuration for the default project.

index.html
index.html is the paimary HTML file. It references the application files and dependencies, style sheets and so on. This file references the root component for the Angular application. 

main.ts
The main.ts file has the code to bootstrap the Angular application.

Application Directory /src/app

Root Module: app.module.ts
src/app/app.module.ts is the root Angular module for the default project generated with Angular CLI.
Angular module is created by decorating a TypeScript class with NgModule.

The Angular module is different from a javascript module. Angular modules may contain one or more components, services, and othe Angular code files. 
It Scopes these units of code. It a component in module-1 needs to be used in module-2, it needs to be exported explicitly.

ngmodule, ng stand for next generation.

App Component (Root Component)
An app component is a set of files that render the first file and the root componentof the application.
App Component contains following components:
src/app/app.component.ts # The component TypeScript code file
src/app/app.component.spec.ts # The component unit test file
src/app/app.component.css # The component style sheet.
src/app/app.component.html # the component view template, It contains HTML markup and handles presentation for the component

Routing ModuleL app-routing.module.ts
src/app/app-routing.module.ts is a module file. Angular CLI generates it only if routing is selected when creating the project.
The purpose of this module is to encapsulate routing logic into its own Angular module.
This module is references and imported into the main module of the application. 
//import routing module (javascript import)
import {AppRoutingModule} from './app-routing.module';
//import it into Angular module
@NgModule({
imports: [
    AppRoutingModule,
],
//Code removed for bervity
})
export class AppModule { }

Scripts
Consider the following scripts in package.json for primary tasks working with an Angular application.

yarn start
or 
npm start

yarn run build
or 
npm run build

yarn run build --prod
or 
npm run build --prod

linting helps you to maintain coding standards and conventions in an ANgular project.
yarn run lint
or 
npm run lint

The JavaScript module system is useful for grouping JavaScript functions, classes, constants, and so forth.
The Angular modules are containers for Angular Components, directives services, and so forth. 

Javascript Modules:
Functions
Classes
Constants
Objects
Interfaces
Custom Types
More..

Angular Modules
Components
Services
Pipes
More..

Root module appl.module.ts
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppComponent } from './app.component';
@NgModule({
    declarations: [
        AppComponent
    ],
    imports: [BrowserModule],
    bootstrap: [AppComponent]
})
export class AppModule { }

NgModule is a decorator needed to create a new module in the Angular application. 
A decorator is a new feature in both javascript and typescript.
In JavaScript, It was a "proposal" feature at the time of authoring this content.

BrowserModule is a required Angular infrastructure module available with the Angular library.
It is required for an Angular application running on a browser like Google Chrome or Firefox.
Angular applications can also run outside the context of a client browser on a Node.js server application.

The ngModule decorator has the following metadata fields.
declarations: An array that declares components and other Angular code to be part of the module.
bootstrap: Specify the root component of the Angular Appllication.
imports: An Angular application includes many Angular modules.

Create a Component with Angular CLI
ng generate component my-sample-component

ng generate module superheroes-material-design

superheroes-material-design.module.ts
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatToolBarModule } from '@angular/material/toolbar';
import { MatCardModule } from '@angular/material/card';

@NgModule({
    imports: [
        BrowserAnimationsModule,
        MatCardModule,
        MatToolBarModule
    ]
    , // ** removed other metadata objects for brevity.
})
export class SuperheroesMaterialDesignModule { }

Import { SuperheroProfileCOmponent } from "./superhero-profile/superhero-profile.component";
Import { SuperheroToolbarCOmponent } from "./superhero-profile/superhero-toolbar.component";

@NgModule({
    declarations: [
        SuperheroProfileCOmponent,
        SuperheroToolbarCOmponent
    ],
    imports: [
        BrowserAnimationsModule,
        MatCardModule,
        MatToolbarModule
    ],
    exports: [
        SuperheroProfileComponent,
        SuperheroToolbarComponen
    ]
})
export class SuperheroesMaterialDesignModule { }


