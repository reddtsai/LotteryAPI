.PHONY:

.DEFAULT:

run:
	dotnet run --project src/lotteryapi.csproj

unittest:
	@echo 'not implement unittest'

deploy:
	@echo 'not implement deploy'

newbranch:
ifdef name
	git checkout master
	git checkout -b $(name)
	git push -u origin $(name)
else
	@echo 'make newbranch name=NewBranchName'
endif

efScaffold:
	dotnet ef dbcontext scaffold "server=127.0.0.1;port=3306;user=root;password=0oibDF67wafbqNkF;database=TaiwanLottery" \
	Pomelo.EntityFrameworkCore.MySql \
	-o Repositories/Entities \
	--context-dir Repositories -c LotteryContext \
	-p src -f

addPackage:
ifdef name
	dotnet add src/lotteryapi.csproj package $(name)
else
	@echo 'make net-package name=PackageName'
endif

removePackage:
ifdef name
	dotnet remove src/lotteryapi.csproj package $(name)
else
	@echo 'make net-package name=PackageName'
endif

listSDK:
	dotnet --list-sdks

restore:
	dotnet restore src/lotteryapi.csproj