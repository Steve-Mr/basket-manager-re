package top.maary.basketmanager.re

import android.app.Application
import top.maary.basketmanager.re.data.repository.GameRepositoryImpl
import top.maary.basketmanager.re.domain.repository.GameRepository

class BasketManagerApplication : Application() {

    lateinit var gameRepository: GameRepository
        private set

    override fun onCreate() {
        super.onCreate()
        instance = this
        gameRepository = GameRepositoryImpl(this)
    }

    companion object {
        lateinit var instance: BasketManagerApplication
            private set
    }
}
