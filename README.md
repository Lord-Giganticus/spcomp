# SPCOMP

Docker image for compiling sourcepawn scripts

## Usage in github actions
```yml

steps:
  setup-spcomp:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [macos-latest, ubuntu-latest] # windows-latest forces the use of Windows docker containers so it can't be used in a job there, I'd reccomend uploading the aritfact then using it in another job.
        build: [mac, linux, windows]
 
    steps:
      - run: |
          docker pull lordgiganticus/spcomp:${{ matrix.build }}
          docker run --name ${{ matrix.build }} lordgiganticus/spcomp:${{ matrix.build }}
          docker cp ${{ matrix.build }}:/scripting ./scripting
      - uses: actions/upload-artifact@v2.2.4
        with:
          name: Binaries for ${{ matrix.build }}
          path: ${{ github.workspace }}/scripting
```
