package com.basketmanager.re

import android.app.Application
import com.basketmanager.re.data.repository.GameRepositoryImpl
import com.basketmanager.re.domain.repository.GameRepository

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
