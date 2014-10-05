# Sailor Module Groups

[![Build Status](http://img.shields.io/travis/sailorjs/sailor-module-groups/master.svg?style=flat)](https://travis-ci.org/sailorjs/sailor-module-groups)
[![Dependency status](http://img.shields.io/david/sailorjs/sailor-module-groups.svg?style=flat)](https://david-dm.org/sailorjs/sailor-module-groups)
[![Dev Dependencies Status](http://img.shields.io/david/dev/sailorjs/sailor-module-groups.svg?style=flat)](https://david-dm.org/sailorjs/sailor-module-groups#info=devDependencies)
[![NPM Status](http://img.shields.io/npm/dm/sailor-module-groups.svg?style=flat)](https://www.npmjs.org/package/sailor-module-groups)

> Support create groups between Users

## Install

```bash
npm install sailor-module-groups
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
	name: 'yourGroupName',
	description: 'yourGroupDescription',
	admin: `yourAdminID`
}
```

Others attributes can be declares when you create a group. check Group model for more information.

### Find all Groups

```
GET /group
```

### Find One Group

```
GET /group/:id
```

You can specified the user that you want to recover in the url by id:

```
GET /Group/1
```

or create a more specified query using url params:

```
GET /user/?private=true
```

### Destroy an Group

```
DELETE /gropu/:id
```

### Management

### Add new User

### Update an User

### Destroy an User

## License

MIT © sailorjs


