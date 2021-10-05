<?php
/**
 * Alxarafe. Development of PHP applications in a flash!
 * Copyright (C) 2018-2020 Alxarafe <info@alxarafe.com>
 */

namespace Alxarafe\Core\Singletons;

use Alxarafe\Core\Base\Singleton;
use Alxarafe\Core\Utils\ClassUtils;
use Aura\Session\Segment;
use Aura\Session\SessionFactory;

/**
 * Class Session.
 * Tools for managing sessions, including session segments and read-once messages
 *
 * @package Alxarafe\Core\Helpers
 */
class Session extends Singleton
{
    /**
     * Session info from cookie.
     *
     * @var \Aura\Session\Session
     */
    protected \Aura\Session\Session $session;

    /**
     * Segment name.
     *
     * @var string
     */
    protected string $segmentName = 'Alxarafe';

    /**
     * Session constructor.
     */
    public function __construct(string $index = 'main')
    {
        parent::__construct($index);
        $shortName = ClassUtils::getShortName($this, static::class);
        $debugTool = DebugTool::getInstance();
        $debugTool->startTimer($shortName, $shortName . ' Constructor');

        $this->session = (new SessionFactory())->newInstance($_COOKIE);
        if (session_status() === PHP_SESSION_NONE) {
            $this->session->start();
        }
        // https://github.com/auraphp/Aura.Session#cross-site-request-forgery

        $debugTool->stopTimer($shortName);
    }

    /**
     * Gets the value of the outgoing CSRF token.
     *
     * @return string
     */
    public function getCsrfToken(): string
    {
        return $this->session->getCsrfToken()->getValue();
    }

    /**
     * Checks whether an incoming CSRF token value is valid.
     *
     * @param string $csrfToken
     *
     * @return bool
     */
    public function isValid(string $csrfToken): bool
    {
        return $this->session->getCsrfToken()->isValid($csrfToken);
    }

    /**
     * Return this session.
     *
     * @return \Aura\Session\Session
     */
    public function getSession(): \Aura\Session\Session
    {
        return $this->session;
    }

    /**
     * Sets segment name.
     *
     * @param string $segmentName
     *
     * @return Session
     */
    public function setSegment(string $segmentName): self
    {
        $this->segmentName = $segmentName;
        return $this;
    }

    /**
     * Get data from segment.
     *
     * @param string $key
     *
     * @return mixed
     */
    public function get(string $key)
    {
        return $this->getSegment()->get($key);
    }

    /**
     * Return segment session.
     *
     * @return Segment
     */
    public function getSegment(): Segment
    {
        return $this->session->getSegment($this->segmentName);
    }

    /**
     * Set data key.
     *
     * @param string $key
     * @param mixed  $value
     *
     * @return $this
     */
    public function set(string $key, $value): self
    {
        $this->getSegment()->set($key, $value);
        return $this;
    }

    /**
     * Sets flash next data by key.
     *
     * @param string $key
     * @param mixed  $value
     *
     * @return $this
     */
    public function setFlash(string $key, $value): self
    {
        $this->setFlashNext($key, $value);
        return $this;
    }

    /**
     * Sets flash next data by key.
     *
     * @param string $key
     * @param mixed  $value
     *
     * @return $this
     */
    public function setFlashNext(string $key, $value): self
    {
        $this->getSegment()->setFlash($key, $value);
        return $this;
    }

    /**
     * Get flash now data by key.
     *
     * @param string $key
     *
     * @return mixed
     */
    public function getFlash(string $key)
    {
        return $this->getFlashNow($key);
    }

    /**
     * Get flash now data by key.
     *
     * @param string $key
     *
     * @return mixed
     */
    public function getFlashNow(string $key)
    {
        return $this->getSegment()->getFlash($key);
    }

    /**
     * Sets flash now data by key.
     *
     * @param string $key
     * @param mixed  $value
     *
     * @return $this
     */
    public function setFlashNow(string $key, $value): self
    {
        $this->getSegment()->setFlashNow($key, $value);
        return $this;
    }

    /**
     * Get flash next data by key.
     *
     * @param string $key
     *
     * @return mixed
     */
    public function getFlashNext(string $key)
    {
        return $this->getSegment()->getFlashNext($key);
    }
}