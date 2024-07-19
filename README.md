# sys6043-final-biofuel
## Todo
- [ ] Feedstock
- [ ] Refinery
- [ ] Transportation
- [ ] Mod File
- [ ] Tweak run file

## Adding a parameter
1. Add parameter values to `biofuel_file.dat`
2. Commit

## Edit on the web
https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files

## Edit locally: Clone Repo
```
git clone https://github.com/HandcartCactus/sys6043-final-biofuel.git .
```
## Edit locally: Get recent changes
See what's changed on the server
```bash
git fetch
```
Pull changes from server
```bash
git pull
```

## Edit locally: Save and share your work
See what's up
```bash
git status
```
Track your changes
```bash
git add filename
```
Save your changes
```bash
git commit -m "Describe your changes"
```
Share your changes
```bash
git push
```

## Run the model
```ampl
include biofuel.run;
```
