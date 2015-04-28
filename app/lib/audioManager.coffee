class AudioManager

    @SOUNDS : [
        { id : "themeOne", src : "./audio/audio1.mp3"}
        { id : "themeTwo", src : "./audio/audio2.mp3"}
    ]
    isPlaying:false

    constructor :() ->
        console.log 'audio Init'
        @currentLoadIndex = 0
        return

    setCallback:(@cb=null)=>
        # console.log "set", @cb
        null

    load : =>
        @loadSound(@currentLoadIndex)
        return

    loadSound : (index) =>

        sound = new Howl({
            urls   : [ AudioManager.SOUNDS[index].src ]
            loop   : AudioManager.SOUNDS[index].loop
            volume : if AudioManager.SOUNDS[index].volume then AudioManager.SOUNDS[index].volume else 1
            onload : =>
                App.data.song[index] = sound
                @onSoundLoaded(index, sound)
            onend : =>
                if @cb then @cb()
        })


    onSoundLoaded : (index, sound) =>
        AudioManager.SOUNDS[index].sound = sound
        if AudioManager.SOUNDS[index].autoPlay
            s = AudioManager.SOUNDS[index]
            @play(s.id, s.fadeIn, s.volume)
        @loadNext()
        return

    loadNext : =>

        if @currentLoadIndex < AudioManager.SOUNDS.length - 1
            @currentLoadIndex++
            @load()
        return

    getSoundById : (id) =>

        size = AudioManager.SOUNDS.length
        for i in [0...size]
            if AudioManager.SOUNDS[i].id == id
                if AudioManager.SOUNDS[i].sound
                    return {status: 1, item: AudioManager.SOUNDS[i]} # 1: loaded
                else
                    return {status: 2, item: AudioManager.SOUNDS[i]} # 2: not loaded
        return {status: 0, item: null} # 0: invalid id

    getTotalTime:(id)=>
        sound = @getSoundById(id)
        sound.item.sound._duration

    play : (id, fadeIn = false, volume = .5, delay = 0) =>

        if delay > 0
            setTimeout(() =>
                @play id, fadeIn, volume
            , delay)
            return

        sound = @getSoundById(id)

        

        if sound.status == 0
            console.log "Invalid ID"
        else if sound.status == 1
            if fadeIn
                sound.item.sound.fadeIn(volume, 4000)
            else
                sound.item.sound.play()
        else if sound.status == 2
            sound.item.autoPlay = true
            sound.item.fadeIn = fadeIn
            sound.item.volume = volume

        @isPlaying = true
        return

    pause : (id) =>
        sound = @getSoundById(id)
        sound.item.sound.pause()
        @isPlaying = false

    stop : (id) =>
        sound = @getSoundById(id)
        sound.item.sound.stop()
        @isPlaying = false


module.exports = AudioManager