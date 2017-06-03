# Express

## Generate skelton
```bash
express [app_name]

express [app_name] --view=[template_type]
```

```bash
cd [app_name]

npm install

npm run start
```

## Bower
```bash
npm install bower -g
```

```bash
cd [app_name]
npm init
```

### config
```bash
touch .bowerrc
```

```json
{
  "directory": "public/bower_components",
  "json": "bower.json"
}
```

### bootstrap
```bash
bower install bootstrap --save
```
