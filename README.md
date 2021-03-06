# Sailor Module Group

[![Build Status](http://img.shields.io/travis/sailorjs/sailor-module-group/master.svg?style=flat)](https://travis-ci.org/sailorjs/sailor-module-group)
[![Dependency status](http://img.shields.io/david/sailorjs/sailor-module-group.svg?style=flat)](https://david-dm.org/sailorjs/sailor-module-group)
[![Dev Dependencies Status](http://img.shields.io/david/dev/sailorjs/sailor-module-group.svg?style=flat)](https://david-dm.org/sailorjs/sailor-module-group#info=devDependencies)
[![NPM Status](http://img.shields.io/npm/dm/sailor-module-group.svg?style=flat)](https://www.npmjs.org/package/sailor-module-group)

> Support create group between Users

## Install

```bash
npm install sailor-module-group
```

**NOTE:** This module need a model user. Use `sailor-module-user` or other module that declare it.

## API

### Basic CRUD

### Register new Group

```
POST /group
```

The minimum information to create a new group is:

```json
{
	name: 'yourGroupName'
}
```

Others attributes can be declares when you create a group. check Group model for more information.

### Find all group

```http
GET /group
```

### Find One Group

```http
GET /group/:id
```

You can specified the user that you want to recover in the url by id:

```http
GET /group/1
```

or create a more specified query using url params:

```http
GET /group/?private=true
GET /group/?private=true?where={"tags":{"contains":"funny"}}
```

### Destroy an Group

```http
DELETE /group/:id
```

### Management

### Add a new User

```http
POST group/1/user"
```
and send the information about the user, like: 

```json
{
	email: "kiko@sailor.com",
	password: "password"}
```

### Remove an User

```http
POST group/1/user"
```
and send the information about the user, like: 

```json
{
	email: "kiko@sailor.com",
	password: "password"}
```

## License

MIT © sailorjs


