#!/bin/bash
set -o verbose

# with a simple rebase before merging to master we can understante very well
# all git log. It is easy to revert a commit now

cd ./scripts/

./common/new-repo.sh
./common/change-user.sh "Bush"
./common/first-commit.sh                                          ;sleep 1

./common/change-user.sh "Obama"
./feat/start.sh                feat/feature-01
./feat/commit.sh               feat/feature-01 line-1             ;sleep 1

./common/change-user.sh "Fixer"
./feat/start.sh                bugfix/fix-1
./feat/commit.sh               bugfix/fix-1 fix-1-line-1          ;sleep 1


./common/change-user.sh "Donald"
./feat/start.sh                feat/feature-02
./feat/commit.sh               feat/feature-02 line-1             ;sleep 1

./common/change-user.sh "Fixer"
./feat/commit.sh               bugfix/fix-1 fix-1-line-2          ;sleep 1

./common/change-user.sh "Fixer"
./feat/start.sh                bugfix/fix-2

./common/change-user.sh "Obama"
./feat/commit.sh               feat/feature-01 line-2             ;sleep 1

./common/change-user.sh "Fixer"
./feat/commit.sh               bugfix/fix-2 fix-2-line-1          ;sleep 1

./common/change-user.sh "Obama"
./feat/commit.sh               feat/feature-01 line-3             ;sleep 1

./common/change-user.sh "Fixer"
./feat/commit.sh               bugfix/fix-1 fix-1-line-3          ;sleep 1
./feat/rebase-from-master.sh   bugfix/fix-1                       ;sleep 1
./feat/merge-to-master.sh      bugfix/fix-1                       ;sleep 1

./common/change-user.sh "Donald"
./feat/commit.sh               feat/feature-02 line-2             ;sleep 1

./common/change-user.sh "Fixer"
./feat/commit.sh               bugfix/fix-2 fix-2-line-2          ;sleep 1

./common/change-user.sh "Donald"
./feat/commit.sh               feat/feature-02 line-3             ;sleep 1
./feat/rebase-from-master.sh   feat/feature-02                    ;sleep 1
./feat/merge-to-master.sh      feat/feature-02                    ;sleep 1

./common/change-user.sh "Fixer"
./feat/commit.sh               bugfix/fix-2 fix-2-line-3          ;sleep 1
./feat/rebase-from-master.sh   bugfix/fix-2                       ;sleep 1
./feat/merge-to-master.sh      bugfix/fix-2                       ;sleep 1

./common/change-user.sh "Obama"
./feat/rebase-from-master.sh   feat/feature-01                    ;sleep 1
./feat/merge-to-master.sh      feat/feature-01                    ;sleep 1


./common/status.sh


#!/bin/bash
set -o verbose
