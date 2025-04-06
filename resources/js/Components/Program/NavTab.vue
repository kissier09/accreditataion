<template>
    <div class="h-full flex gap-1.5">
        <Link 
            :href="'/program/instrument'"
            class="h-full flex items-center border-b-[3px] justify-center mr-2.5 transition_300"
            :class="[$page.url.startsWith('/program/instrument') ? 'border-earistRed text-earistRed font-semibold':'group hover:border-earistRed border-transparent']"
        >
            <div class="rounded group-hover:bg-earistRed/20 group-hover:text-earistRed px-2 py-2.5 flex gap-2">
                View Instrument
            </div>
        </Link>
    </div>
</template>